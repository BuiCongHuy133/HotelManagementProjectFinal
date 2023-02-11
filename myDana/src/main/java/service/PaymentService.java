package service;

import entity.Payment;

public interface PaymentService {
    Payment Check(String type_payment, String cardName, String cardNumber,int expressMonth,long expressYear,long amount);
    void Pay(long amount,int id);
    void Refund(long amount, int id);
}
