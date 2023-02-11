package service;

import entity.Payment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.PaymentRepository;

@Service(value = "paymentSerivce")
public class PaymentServiceImpl implements PaymentService {
    @Autowired
    private PaymentRepository paymentRepository;

    @Override
    public Payment Check(String type_payment, String cardName, String cardNumber, int expressMonth, long expressYear,long amount) {
        return paymentRepository.CompareCardPayment(type_payment,cardName,cardNumber,expressMonth,expressYear,amount);
    }

    @Override
    public void Pay(long amount,int id) {
        paymentRepository.Pay(amount,id);
    }

    @Override
    public void Refund(long amount,int id) {
        paymentRepository.Refund(amount,id);
    }
}
