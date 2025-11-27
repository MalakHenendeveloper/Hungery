// ============================================================================
// Use Case: إضافة منتجات للسلة
// ============================================================================
// الغرض: تمثيل حالة استخدام واحدة من النظام (Single Responsibility)
// في Clean Architecture:
// - كل Use Case يمثل عملية واحدة (مثل: إضافة للسلة، حذف من السلة، إلخ)
// - Use Case مافيهش تفاصيل عن الـ UI أو الـ API
// - فقط Business Logic نقي
//
// دوره:
// 1. استقبال البيانات من Presentation Layer (ViewModel)
// 2. استدعاء Repository
// 3. إرجاع النتيجة
// ============================================================================

import 'package:dartz/dartz.dart';
import 'package:hungery/Domian/Repositories/CartRepository.dart';
import 'package:injectable/injectable.dart';

import '../../../Data/Model/Cart/AddToCartDto.dart';
import '../../../Data/Model/Cart/AddToCartRequest.dart';
import '../Fauilers.dart';

/// Use Case لإضافة منتجات للسلة
@injectable
class AddToCartUseCase {
  CartRepository repository; // المستودع للوصول للبيانات

  AddToCartUseCase({required this.repository});

  /// استدعاء Use Case
  /// الـ call function تسمح لك تستخدم الكلاس كـ function
  /// مثال: addToCartUseCase(request) بدلاً من addToCartUseCase.execute(request)
  Future<Either<Fauliers, AddToCartDto>> call(AddToCartRequest request) {
    // ببساطة: استدعي Repository وأرجع النتيجة
    return repository.addToCart(request);
  }
}
