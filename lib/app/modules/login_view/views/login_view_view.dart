import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_view_controller.dart';
class LoginViewView extends GetView<LoginViewController> {
  const LoginViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('请输入手机号'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            _buildPhoneField(),
            const SizedBox(height: 16),
            _buildCodeField(),
            const SizedBox(height: 32),
            Obx(() => ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                backgroundColor: controller.isLoginEnabled.value
                    ? Colors.black
                    : Colors.grey,
              ),
              onPressed: controller.isLoginEnabled.value
                  ? controller.onLoginPressed
                  : null,
              child: const Text('登录注册'),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
      ),
      child: Row(
        children: [
          const Text('+86', style: TextStyle(fontSize: 16)),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: '请输入手机号',
                border: InputBorder.none,
              ),
              onChanged: controller.onPhoneChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeField() {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 10,right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: '请输入验证码',
                border: InputBorder.none,
              ),
              onChanged: controller.onCodeChanged,
            ),
          ),
          const SizedBox(width: 12),
          Obx(() => TextButton(
            onPressed: controller.canSendCode.value
                ? controller.sendCode
                : null,
            child: Text(controller.sendCodeLabel.value),
          )),
        ],
      ),
    );
  }
}
