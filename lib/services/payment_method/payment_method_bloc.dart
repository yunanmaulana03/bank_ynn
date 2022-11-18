import 'package:bank_ynn/models/payment_method.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../payment_method_services.dart';

part 'payment_method_event.dart';
part 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  PaymentMethodBloc() : super(PaymentMethodInitial()) {
    on<PaymentMethodEvent>((event, emit) async {
      try {
        emit(PaymentMethodLoading());

        final paymentMethods = await PaymentMethodService().getPaymentMethods();

        emit(PaymentMethodSuccess(paymentMethods));
      } catch (e) {
        emit(PaymentMethodFailed(e.toString()));
      }
    });
  }
}
