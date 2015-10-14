$ ->
  $('#imageimpr').imagesLoaded ->
    $('#imageimpr').masonry
      itemSelector: '.box'
      isFitWidth: true