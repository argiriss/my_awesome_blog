import $ from "jquery"
import "select2/dist/css/select2.css"
import "select2"


$(document).ready(function() {
  if ($("select#post_hashtag_ids").length) {
    $("select#post_hashtag_ids").select2({
      placeholder: "Select or create a new hashtag",
      width: "100%",
      tags: true
    });
  }
});