import { Modal } from 'bootstrap'

$( document ).on('turbolinks:load',
() => {
    showNoticeModal()
  }
)

// フラッシュメッセージが記載されたmodalを表示する
function showNoticeModal() {
    const noticeModal = new Modal(document.getElementById('notice-modal'), {
      backdrop: true
    })
    noticeModal.show()
}