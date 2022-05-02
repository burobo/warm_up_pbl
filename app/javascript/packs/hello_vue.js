import { createApp } from 'vue'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-hello-vue';
  if(document.querySelector(selector)){
    const app = createApp(App).mount(selector);
  }
  console.log(app);
})
