import { createPicker } from 'picmo';

window.onload = function () {
  const container = document.querySelector('.pickerContainer');
  const picker = createPicker({
    rootElement: container
  });
};
