import { Modal } from 'bootstrap'

document.addEventListener("turbolinks:load", () => {
    const noticeModal = new NoticeModal()
    noticeModal.show()
    setTimeout(() => noticeModal.hide(), 2000)
  }
)

class NoticeModal {
  constructor() {
    this._modal = new Modal(document.getElementById('notice-modal'));
  }
  
  // フラッシュメッセージが記載されたmodalを表示する
  show() {
    this._modal.show()
  }
  
  // フラッシュメッセージが記載されたmodalを非表示する
  hide() {
    this._modal.hide()
  }
}
