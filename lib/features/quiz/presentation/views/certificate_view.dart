import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../domain/models/quiz_model.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class CertificateView extends ConsumerWidget {
  final QuizResult result;

  const CertificateView({super.key, required this.result});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider).value;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Certificate of Completion'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.p24),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSizes.p32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primary, width: 10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(Icons.workspace_premium, size: 80, color: Colors.amber),
                    const SizedBox(height: AppSizes.p24),
                    const Text(
                      'CERTIFICATE OF COMPLETION',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: AppSizes.p32),
                    const Text('This is proudly presented to', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: AppSizes.p16),
                    Text(
                      user?.name.toUpperCase() ?? 'STUDENT',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'serif',
                      ),
                    ),
                    const SizedBox(height: AppSizes.p24),
                    const Text(
                      'For successfully passing the Final Assessment and completing the course.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    const SizedBox(height: AppSizes.p32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              DateFormat.yMMMd().format(result.completedAt),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text('Date', style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${(result.score * 100).toInt()}%',
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                            ),
                            const Text('Score', style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.p32),
              ElevatedButton.icon(
                onPressed: () {
                  // Simulating download/save logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Certificate saved to gallery!')),
                  );
                },
                icon: const Icon(Icons.download),
                label: const Text('Download Certificate'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: AppSizes.p16),
              TextButton(
                onPressed: () => context.go('/dashboard'),
                child: const Text('Return to Dashboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
