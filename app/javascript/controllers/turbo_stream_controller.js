import { Controller } from 'stimulus';

export default class extends Controller {
  // eslint-disable-next-line class-methods-use-this
  injectHeaders () {
    const injectHeaders = (event) => {
      const { headers } = event.detail.fetchOptions || {};
      if (headers) {
        headers.Accept = `text/vnd.turbo-stream.html, ${headers.Accept}`;
      }
    };
    window.addEventListener('turbo:before-fetch-request', injectHeaders, { once: true });
  }
}
