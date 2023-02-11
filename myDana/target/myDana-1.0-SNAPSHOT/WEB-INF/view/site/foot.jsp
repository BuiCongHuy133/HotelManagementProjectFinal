
<a href="#home" class="toTop scroll"><i class="fa fa-angle-up"></i></a>


<!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
  <!-- The container for the modal slides -->
  <div class="slides"></div>
  <!-- Controls for the borderless lightbox -->
  <h3 class="title">title</h3>
  <a class="prev">‹</a>
  <a class="next">›</a>
  <a class="close">×</a>
  <!-- The modal dialog, which will be used to wrap the lightbox content -->
</div>


<script src="${pageContext.request.contextPath}/resources/assets/jquery.js"></script>

<!-- wow script -->
<script src="${pageContext.request.contextPath}/resources/assets/wow/wow.min.js"></script>

<!-- uniform -->
<script src="${pageContext.request.contextPath}/resources/assets/uniform/js/jquery.uniform.js"></script>

<%--sweetalert--%>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- boostrap -->
<script src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/bootstrap.js" type="text/javascript" ></script>
<%--slide room--%>
<script src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/slide_room.js" type="text/javascript" ></script>

<!-- jquery mobile -->
<script src="${pageContext.request.contextPath}/resources/assets/mobile/touchSwipe.min.js"></script>

<!-- jquery mobile -->
<script src="${pageContext.request.contextPath}/resources/assets/respond/respond.js"></script>

<!-- gallery -->
<script src="${pageContext.request.contextPath}/resources/assets/gallery/jquery.blueimp-gallery.min.js"></script>

<!-- custom script -->
<script src="${pageContext.request.contextPath}/resources/assets/script.js"></script>
<%--slide--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js"></script>
<script>
  $(document).ready(function() {
    $("#news-slider").owlCarousel({
      items : 3,
      itemsDesktop:[1199,3],
      itemsDesktopSmall:[980,2],
      itemsMobile : [600,1],
      navigation:true,
      navigationText:["",""],
      pagination:true,
      autoPlay:true
    });
  });
</script>
<script>
  const imgs = document.querySelectorAll('.img-select a');
  const imgBtns = [...imgs];
  let imgId = 1;

imgBtns.forEach((imgItem) => {
  imgItem.addEventListener('click', (event) => {
    event.preventDefault();
    imgId = imgItem.dataset.id;
    slideImage();
  });
});

function slideImage(){
  const displayWidth = document.querySelector('.img-showcase img:first-child').clientWidth;

  document.querySelector('.img-showcase').style.transform = `translateX(${- (imgId - 1) * displayWidth}px)`;
}

window.addEventListener('resize', slideImage);
</script>

<script>
  const imgs = document.querySelectorAll('.img-select a');
  const imgBtns = [...imgs];
  let imgId = 1;

  imgBtns.forEach((imgItem) => {
    imgItem.addEventListener('click', (event) => {
      event.preventDefault();
      imgId = imgItem.dataset.id;
      slideImage();
    });
  });

  function slideImage(){
    const displayWidth = document.querySelector('.img-showcase img:first-child').clientWidth;

    document.querySelector('.img-showcase').style.transform = `translateX(${- (imgId - 1) * displayWidth}px)`;
  }

  window.addEventListener('resize', slideImage);
</script>
<script>
  var now = new Date();

  var day = ("0" + (now.getDate()+1)).slice(-2);
  var day2 = ("0" + (now.getDate()+2)).slice(-2);

  var month = ("0" + (now.getMonth() + 1)).slice(-2);

  var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
  var today2 = now.getFullYear()+"-"+(month)+"-"+(day2) ;

  $('#datePicker').val(today);
  $('#datePicker2').val(today2);
</script>
