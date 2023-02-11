package controller;


import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.*;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/booking")
public class BookingController {
    @Autowired
    private RoomCategoryService roomCategoryService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private BookingDetailService bookingDetailService;

    @Autowired
    private GuestService guestService;

    @Autowired
    private UserService userService;

    @Autowired
    private PaymentService paymentService;


    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String newBooking(){
        return "redirect:/home";
    }

    @RequestMapping(value = "/form",method = RequestMethod.GET)
    public String searchRoomById(@RequestParam(name="roomCateId") int id, Model model){

        RoomCategory roomCategory = roomCategoryService.getRoomCateById(id);
        model.addAttribute("bookingRegistration", new BookingRegistation());
        model.addAttribute("roomCate",roomCategory);
        return "site/booking/index";
    }
    @RequestMapping(value = "/saveBooking",method = RequestMethod.POST)
    public String saveUser(@ModelAttribute("bookingRegistration") BookingRegistation bookingRegistation, Model model, HttpSession session){
        if(bookingRegistation.getUserID() != null ){
            User user = userService.getUserById(bookingRegistation.getUserID());
            bookingRegistation.getBooking().setUser_booking(user);
        }
        Booking obe =  bookingService.saveBooking(bookingRegistation.getBooking());
        bookingRegistation.getBookingDetail().setBooking(obe);

        Guest guest = guestService.saveGuest(bookingRegistation.getGuest());
        bookingRegistation.getBookingDetail().setGuest(guest);

        bookingDetailService.saveBooking(bookingRegistation.getBookingDetail());

        RoomCategory roomCategory = roomCategoryService.getRoomCateById(bookingRegistation.getBookingDetail().getRoomCategory().getId());

        int quantity =roomCategory.getQuantity(); quantity--;

        roomCategoryService.Quantity(quantity,roomCategory.getId());

        model.addAttribute("payment", new Payment());
        model.addAttribute("bookingID", bookingRegistation.getBooking().getId());
        session.setAttribute("external_ID",bookingRegistation.getBooking().getExternalID());
        session.setAttribute("price", roomCategory.getPrice());

        return "site/booking/payment";
    }
    @RequestMapping(value = "payment",method = RequestMethod.GET)
    public String PaymentBookingExist(@RequestParam("bookingID") int bookingID,@RequestParam("amount") long amount,HttpSession session,Model model){
        Booking booking = bookingService.getBookingById(bookingID);

        model.addAttribute("booking",booking);
        session.setAttribute("price",amount);
        session.setAttribute("external_ID",booking.getExternalID());
        model.addAttribute("payment", new Payment());
        return "site/booking/payment";
    }
    @RequestMapping(value = "checkPayment",method = RequestMethod.GET)
    public String checkPayment(@RequestParam("bookingID") int bookingID,
                               @RequestParam("type_payment") String type_payment,
                               @RequestParam("cardName") String cardName,
                               @RequestParam("cardNumber") String cardNumber,
                               @RequestParam("expressMonth") int expressMonth,
                               @RequestParam("expressYear") long expressYear,
                               @RequestParam("amount") long amount,
                               Model model,
                               HttpSession session){
        Payment paymentChecked = paymentService.Check(type_payment,cardName,cardNumber,expressMonth,expressYear,amount);
        if(paymentChecked != null){
            int paymentCheckedId = paymentChecked.getId();
            paymentService.Pay(amount,paymentCheckedId);
            bookingService.BookingPay(paymentChecked,bookingID);
            return "redirect:/booking/PaymentSuccess";
        } else {
            return "redirect:/booking/PaymentFail";
        }
    }
    @RequestMapping(value = "/PaymentSuccess")
    public String PaymentSuccess(){
        return "site/booking/PaymentSuccess";
    }
    @RequestMapping(value = "/PaymentFail")
    public String PaymentFail(){
        return "site/booking/PaymentFail";
    }
    @RequestMapping(value = "userBooking",method = RequestMethod.GET)
    public String userBooking(@RequestParam(name = "id")int id, Model model){

        List<Booking> bookingList = bookingService.getBookingByUserId(id);
        model.addAttribute("userBooking",bookingList);
        return "site/booking/userBooking";
    }

    @RequestMapping(value = "searchBookingIn")
    public String searchBookingIndex(){
        return "site/booking/searchBooking";
    }

    @RequestMapping(value = "/searchBooking",method = RequestMethod.GET)
    public String searchBooking(@RequestParam(name = "searchKey") String searchKey,Model model){
        Booking booking;
        if(searchKey.isEmpty()){
            booking = new Booking();
            model.addAttribute("msg", "Booking ID does not right");
        }else {
            booking = bookingService.searchBookingByExternalID(searchKey);
            if(booking == null){
            model.addAttribute("msg", "Booking ID does not right");
            }
        }
        model.addAttribute("booking", booking);
        return "site/booking/searchBooking";
    }

    @RequestMapping(value = "cancelBooking")
    public String cancelBooking(@RequestParam(name = "date_check_in")String date_check_in,
                                @RequestParam(name = "bookingID") int bookingDeID, Model model) {

        LocalDate dateCheckIn = LocalDate.parse(date_check_in);
        LocalDate localDate = LocalDate.now();
        if (dateCheckIn.isAfter(localDate)) {
            BookingDetail bookingDetail = bookingDetailService.findBookingDetailById(bookingDeID);

            bookingDetailService.cancelBooking(bookingDeID);
            bookingService.cancelBooking(bookingDetail.getBooking().getId());
            guestService.cancelBooking(bookingDetail.getGuest().getId());

            if (bookingDetail.getBooking().getPayment_booking() != null) {
                int paymentID = bookingDetail.getBooking().getPayment_booking().getId();
                long amount = bookingDetail.getRoomCategory().getPrice();
                long amountRefund = (amount*80)/100;
                paymentService.Refund(amountRefund,paymentID);
                return "redirect:/booking/searchBookingIn2";
            } else {
                return "redirect:/booking/searchBookingIn3";
            }
        } else {
            return "redirect:/booking/searchBookingIn4";
        }
    }




    @RequestMapping(value = "searchBookingIn2")
    public String searchBookingIndex2(Model model){
        model.addAttribute("msg", "You Booking is cancel success! 80% price of room will be refund");
        return "site/booking/searchBooking";
    }
    @RequestMapping(value = "searchBookingIn3")
    public String searchBookingIndex3(Model model){
        model.addAttribute("msg", "You Booking is cancel success!");
        return "site/booking/searchBooking";
    }
    @RequestMapping(value = "searchBookingIn4")
    public String searchBookingIndex4(Model model){
        model.addAttribute("msg", "You cannot cancel your reservation at this time");
        return "site/booking/searchBooking";
    }
}
