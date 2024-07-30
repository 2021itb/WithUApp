import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:with_u/env/env.dart';

//추후 threadId 받을 수 있게 수정

class Api {
  //thread id return
  Future<String> makeThread() async {
    final url = Uri.parse('https://api.openai.com/v1/threads');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Env.openAiApiKey}',
      'OpenAI-Beta': 'assistants=v2',
    };

    final response = await http.post(url, headers: headers, body: '');
    if (response.statusCode == 200) {
      print('Thread created successfully:');
      return jsonDecode(response.body)['id'];
    } else {
      print('Failed to create thread. Status code: ${response.statusCode}');
      return 'error';
    }
  }

  // Future<void> addMessageToTheThread(String message, String threadId) async {
  //   final url =
  //       Uri.parse('https://api.openai.com/v1/threads/$threadId/messages');
  Future<void> addMessageToTheThread(String message) async {
    final url = Uri.parse(
        'https://api.openai.com/v1/threads/thread_XcMQNBdbH3HyneptBJYwyJRJ/messages');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Env.openAiApiKey}',
      'OpenAI-Beta': 'assistants=v2',
    };
    final body = jsonEncode({'role': 'user', 'content': message});

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print('Message sent successfully:');
        print(response.body);
      } else {
        print('Failed to send message. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  // Future<void> createRun(String threadId) async {
  //   final url = Uri.parse('https://api.openai.com/v1/threads/$threadId/runs');
  Future<void> createRun() async {
    final url = Uri.parse(
        'https://api.openai.com/v1/threads/thread_XcMQNBdbH3HyneptBJYwyJRJ/runs');
    final headers = {
      'Authorization': 'Bearer ${Env.openAiApiKey}',
      'Content-Type': 'application/json',
      'OpenAI-Beta': 'assistants=v2',
    };
    final body = jsonEncode(
        {'assistant_id': 'asst_JOEEKN5NfmSNQXOnaRrRe6wC', 'instructions': ''});

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print('Run created successfully:');
        print(response.body);
      } else {
        print('Failed to create run. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  // Future<String> getMessage(String threadId) async {
  //   final url =
  //       Uri.parse('https://api.openai.com/v1/threads/$threadId/messages');
  Future<List<dynamic>> getMessage() async {
    final url = Uri.parse(
        'https://api.openai.com/v1/threads/thread_XcMQNBdbH3HyneptBJYwyJRJ/messages');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Env.openAiApiKey}',
      'OpenAI-Beta': 'assistants=v2',
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
    // return jsonDecode(response.body)['data'][0]['content'][0]['text']
    //     ['value'];
    return jsonDecode(response.body)['data'];
    } else {
    return [];
    }
  }
}
