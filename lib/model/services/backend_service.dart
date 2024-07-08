// ignore_for_file: camel_case_types

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opulizer/utils/constants.dart';
import 'package:opulizer/utils/response_handler.dart';
import 'package:http/http.dart' as http;

class BackendService {
  Future<bool> initiateBackendPopulation(String ipAddress) async {
    try {
      final response = await http.get(
        Uri.http(
          ipAddress + Constants.port,
          '/start',
        ),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Future.error(
            response.statusCode.parseStatusCode(), StackTrace.current);
      }
    } catch (e, s) {
      log(
        e.toString(),
        stackTrace: s,
        name: 'initiation of backend population',
        time: DateTime.now(),
        zone: Zone.current,
      );
      rethrow;
    }
  }

  Future<String> testServer(String ipAddress) async {
    try {
      final response = await http.get(Uri.http(ipAddress + Constants.port));
      return response.body;
    } catch (e, s) {
      log(
        e.toString(),
        stackTrace: s,
        name: 'termination of backend population',
        time: DateTime.now(),
        zone: Zone.current,
      );
      rethrow;
    }
  }

  Future<bool> terminateBackendPopulation(String ipAddress) async {
    try {
      final response = await http.get(
        Uri.http(
          ipAddress + Constants.port,
          '/stop',
        ),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Future.error(
            response.statusCode.parseStatusCode(), StackTrace.current);
      }
    } catch (e, s) {
      log(
        e.toString(),
        stackTrace: s,
        name: 'termination of backend population',
        time: DateTime.now(),
        zone: Zone.current,
      );
      rethrow;
    }
  }
}

final backendServiceProvider =
    Provider<BackendService>((ref) => BackendService());
