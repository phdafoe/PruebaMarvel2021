//
//  ServiceManager.swift
//  Marvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//
import Foundation

protocol RequestManager {
    var delegate: BaseProviderDelegate? { get set }
    func request(_ customRequest: CustomRequest, success: @escaping (CustomResponse) -> Void, failure: @escaping (CustomErrorModel) -> Void) -> URLSessionTask?
}

class NativeManager: RequestManager {
	// swiftlint:disable function_parameter_count
	// swiftlint:disable multiple_closures_with_trailing_closure

	weak var delegate: BaseProviderDelegate?

	var requestHttpHeaders = RestEntity()
	var urlQueryParameters = RestEntity()
	var httpBodyParameters = RestEntity()

	func request(_ customRequest: CustomRequest, success: @escaping (CustomResponse) -> Void, failure: @escaping (CustomErrorModel) -> Void) -> URLSessionTask? {

		let endpoint = customRequest.endpoint //URLEndpoint.buildURL(urlContext: dto.urlContext, endpoint: dto.endpoint)

		for currentHeader in customRequest.headers {
			requestHttpHeaders.add(value: currentHeader.value, forKey: currentHeader.key)
		}

		var targetURL = URL(string: endpoint)

		if let params = customRequest.params {
			for param in params {
				let value: String = (param.value as? String) ?? "\(param.value)"

				if customRequest.method == .get {
					urlQueryParameters.add(value: value, forKey: param.key)
					targetURL = addURLQueryParameters(toURL: URL(string: endpoint)!)
				} else {
					httpBodyParameters.add(value: value, forKey: param.key)
				}
			}
		}

		let httpBody: Data? = customRequest.method != .get ? getHttpBody(params: customRequest.params) : nil
		guard let request = prepareRequest(withURL: targetURL, httpBody: httpBody, httpMethod: customRequest.method) else {
			failure(CustomErrorModel(httpClientError: .unknownError, backendError: .unknownError))
			return nil
		}

		delegate?.requestDone(customRequest: customRequest)

		let sessionConfiguration = URLSessionConfiguration.default
		let session = URLSession(configuration: sessionConfiguration)
		let task = session.dataTask(with: request) { data, response, error in
			
			self.delegate?.responseGet(customRequest: customRequest)
			
			if let httpResponse = response as? HTTPURLResponse {
				BaseProviderUtils.manageResponse(customRequest: customRequest, response: httpResponse, data: data, success: { data in

					DispatchQueue.main.async {
						success(CustomResponse(data: data))
					}
				}) { error in

					DispatchQueue.main.async {
						failure(error)
					}
				}
			} else {
				failure(CustomErrorModel(httpClientError: .notFound, backendError: .unknownError))
			}
		}
		task.resume()
		return task
	}

	// MARK: - Private Methods

	private func addURLQueryParameters(toURL url: URL) -> URL {
		if urlQueryParameters.totalItems() > 0 {
			guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return url }
			var queryItems = [URLQueryItem]()
			if urlComponents.queryItems == nil {
				urlComponents.queryItems = queryItems
			}

			for (key, value) in urlQueryParameters.allValues() {
				let item = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))

				queryItems.append(item)
				urlComponents.queryItems?.append(item)
			}

			guard let updatedURL = urlComponents.url else { return url }
			return updatedURL
		}

		return url
	}

	private func getHttpBody(params: [String: Any]? = nil) -> Data? {
		guard let contentType = requestHttpHeaders.value(forKey: "Content-Type") as? String else { return nil }

		if contentType.contains("application/json") {
			if let params = params {
				if #available(iOS 11.0, *) {
					return try? JSONSerialization.data(withJSONObject: params, options: [.prettyPrinted, .sortedKeys])
				} else {
					return nil
				}
			} else {
				if #available(iOS 11.0, *) {
					let body = try? JSONSerialization.data(withJSONObject: httpBodyParameters.allValues(), options: [.prettyPrinted, .sortedKeys])
					return body
				} else {
					return nil
				}
			}

		} else if contentType.contains("application/x-www-form-urlencoded") {
			let bodyString = httpBodyParameters.allValues().map { "\($0)=\(String(describing: "\($1)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!))" }.joined(separator: "&")
			return bodyString.data(using: .utf8)
		} else {
			return nil
		}
	}

	private func prepareRequest(withURL url: URL?, httpBody: Data?, httpMethod: HTTPMethod) -> URLRequest? {
		guard let url = url else { return nil }
		var request = URLRequest(url: url)
		request.httpMethod = httpMethod.rawValue

		for (header, value) in requestHttpHeaders.allValues() {
			request.setValue("\(value)", forHTTPHeaderField: header)
		}

		request.httpBody = httpBody
		return request
	}

	struct RestEntity {
		private var values: [String: Any] = [:]

		mutating func add(value: Any, forKey key: String) {
			values[key] = value
		}

		func value(forKey key: String) -> Any? {
			return values[key]
		}

		func allValues() -> [String: Any] {
			return values
		}

		func totalItems() -> Int {
			return values.count
		}
	}
}
