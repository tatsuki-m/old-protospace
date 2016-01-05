$(function() {
  var mainImage = '#main_image_uploader'
  var subImage1 = '#sub_image_1_uploader'
  var subImage2 = '#sub_image_2_uploader'
  var subImage3 = '#sub_image_3_uploader'

  function uploadImage(className) {
    $(className + ' input[type=file]').change(function(){
      var file = $(this).prop('files')[0];

      if(file.type.match('image.*')) {
        var reader = setImageToSrc(className)
        reader.readAsDataURL(file);
      } else {
        alert("upload image data")
        return;
      }
    });
  }

  function setImageToSrc(className) {
    var reader = new FileReader();
    reader.onload = function() {
      arrangeStyle(className, reader)
    }
    return reader
  }

  function arrangeStyle(className, reader) {
    var img_src = $(className + ' img').attr('src', reader.result);
    $(className + ' img').addClass("upload-image");
    $(className).css("background-image", "none")
  }


  uploadImage(mainImage);
  uploadImage(subImage1);
  uploadImage(subImage2);
  uploadImage(subImage3);
})
