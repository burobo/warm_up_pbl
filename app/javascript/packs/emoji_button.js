import { createPicker } from 'picmo';

window.onload = function () {
  // emojipicker生成
  const container = document.querySelector('.pickerContainer');
  const picker = createPicker({
    rootElement: container
  });

  //選択された絵文字をセットする
  picker.addEventListener('emoji:select', event => {
    document.getElementById('emoji_field').value = event.emoji;
  });
};