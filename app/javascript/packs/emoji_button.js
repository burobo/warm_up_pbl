import { createPicker } from 'picmo';
import emojiData from 'emojibase-data/en/data.json';
import messages from 'emojibase-data/en/messages.json';

window.addEventListener("turbolinks:load", function() {
  // 既存の絵文字取得
  const initEmojiElem = document.getElementById('init_emoji');
  let initEmoji = '🌱';
  const categories = [
    'recents',
    'smileys-emotion' ,
    'people-body' ,
    'animals-nature' ,
    'food-drink' ,
    'travel-places',
    'activities' ,
    'symbols' ,
    'objects' ,
    'flags' ,
    'custom'
  ];

  if (initEmojiElem !== null && initEmojiElem.value.length !== 0){
    initEmoji = initEmojiElem.value;
  }
  const initCategory = categories[emojiData.find((record) => record.emoji === initEmoji).group];

  // emojipicker生成
  const container = document.querySelector('.pickerContainer');
  const picker = createPicker({
    rootElement: container,
    emojiData,
    messages,
    showCategoryTabs:true,
    initialCategory:initCategory,
    initialEmoji:initEmoji
  });

  //選択された絵文字をセットする
  picker.addEventListener('emoji:select', event => {
    document.getElementById('emoji_field').value = event.emoji;
  });
});