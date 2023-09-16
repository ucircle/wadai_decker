$(document).ready(function() {
  $('ul').on('click', 'li', function() {
    var tagText = $(this).text();
    var tagField = $('input#topic_tag_names'); // タグを入力するフィールドのセレクターに適切なIDを使用してください
    tagField.val(tagField.val() + tagText + ' ');
  });
});
