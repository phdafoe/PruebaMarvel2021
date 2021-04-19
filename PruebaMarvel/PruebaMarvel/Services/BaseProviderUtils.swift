//
//  ServiceManager.swift
//  Marvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import Foundation

class BaseProviderUtils {
	// swiftlint:disable function_parameter_count
	static let dateFormat = "dd/MM/yyyy-HH:mm:ss"

	static func printRequest(_ customRequest: CustomRequest) {
		let data = customRequest.arrayParams != nil
			? try? JSONSerialization.data(withJSONObject: customRequest.arrayParams ?? [:], options: .prettyPrinted)
			: try? JSONSerialization.data(withJSONObject: customRequest.params ?? [], options: .prettyPrinted)

		Utils.print("************* REQUEST **************")
		Utils.print("Request Date: \(Date().format(format: dateFormat))")
		Utils.print("URL: \(customRequest.fullEndpoint)")
		if customRequest.additionalConfiguration.printLog {
			Utils.print("PARAMETERS: ")
			Utils.print(String(data: data ?? Data(), encoding: .utf8) ?? "")
			Utils.print("HEADERS: \(customRequest.headers)")
		}
		Utils.print("************* END *************")
	}

	static func printSuccessResponse(endpoint: String, data: Data, decryptedBytes: Data?, printData: Bool) {
		Utils.print("*************************** RESPONSE ***************************")
		Utils.print("Response Date: \(Date().format(format: dateFormat))")
		Utils.print("URL: \(endpoint)")
		if printData {
			Utils.print(String(data: data, encoding: .utf8) ?? "")
			Utils.print(String(data: decryptedBytes ?? Data(), encoding: .utf8) ?? "")
		}

		Utils.print("********* END ***********")
	}

	static func printFailureResponse(endpoint: String, data: Data?, decryptedBytes: Data?, printData: Bool) {
		Utils.print("*************************** RESPONSE ***************************")
		Utils.print("Response Date: \(Date().format(format: dateFormat))")
		Utils.print("URL: \(endpoint)")

		if printData {
			Utils.print(String(data: data ?? Data(), encoding: .utf8) ?? "")
			Utils.print(String(data: decryptedBytes ?? Data(), encoding: .utf8) ?? "")
		}
	}

//	static func manageResponseData(data: Data?, encrypted: Bool) -> Data? {
//		guard let data = data else { return nil }
//
//		var decryptedBytes: Data?
//
//		if encrypted {
//			// Desencriptar
//
//		} else {
//			decryptedBytes = data
//		}
//
//		return decryptedBytes
//	}
//
//	static func apiResponseError(responseData: Data?, responseStatusCode: Int?, failure: @escaping (CustomErrorModel) -> Void) {
//		let errorModel = CustomErrorModel(data: responseData, httpCode: responseStatusCode)
//
//		Utils.print(errorModel)
//		Utils.print("*************************** END ***************************")
//
//		failure(errorModel)
//	}
//
//
//
//	static func manageResponse(customRequest: CustomRequest, response: HTTPURLResponse, data: Data?, success: (Data?) -> Void, failure: @escaping (CustomErrorModel) -> Void) {
//
//		print(response.statusCode)
//		if (200 ..< 300).contains(response.statusCode) {
//
//			guard let data = data else {
//				apiResponseError(responseData: nil,
//								 responseStatusCode: response.statusCode,
//								 failure: failure)
//				return
//			}
//
//			let decryptedBytes = BaseProviderUtils.manageResponseData(data: data, encrypted: customRequest.additionalConfiguration.encrypted)
//			printSuccessResponse(endpoint: customRequest.fullEndpoint, data: data, decryptedBytes: decryptedBytes, printData: customRequest.additionalConfiguration.printLog)
//			success(decryptedBytes)
//		} else {
//			let decryptedBytes = BaseProviderUtils.manageResponseData(data: data, encrypted: customRequest.additionalConfiguration.encrypted)
//			printFailureResponse(endpoint: customRequest.fullEndpoint, data: data, decryptedBytes: decryptedBytes, printData: customRequest.additionalConfiguration.printLog)
//			apiResponseError(responseData: decryptedBytes,
//							 responseStatusCode: response.statusCode,
//							 failure: failure)
//			return
//		}
//	}

	static func getData(name: String, withExtension: String = "json", forClass: AnyClass) -> Data? {
		let bundle = Bundle(for: forClass)
		let fileUrl = bundle.url(forResource: name, withExtension: withExtension)
		let data = try? Data(contentsOf: fileUrl!)
		return data
	}
	
	static func getHeadersFromContext(_ context: URLEndpoint.BaseURLContext, authenticated: Bool) -> [String: String] {

		switch context {
		case .marvel:
            return ["Referer": "developer.marvel.com"]
		}
	}
}
