document.addEventListener('turbolinks:load', () => {
  new ProgressBarUpdater().init()
})

class ProgressBarUpdater {
  init = () => {
    this.container = document.querySelector('.progress-bar-container')
    this.indicator = document.querySelector('.progress-bar-indicator')

    if (this.container && this.indicator) {
      this.update();
    }
  }

  update = () => {
    const {total, current} = this.container.dataset;

    const progress = Math.floor(current / total * 100);
    this.indicator.style.width = `${progress}%`;
  }
}
