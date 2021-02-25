import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['element']

  remove() {
    this.elementTarget.remove();
  }
};
