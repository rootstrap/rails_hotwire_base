import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['userMenu', 'mobileMenu', 'mobileOpenMenuIcon', 'mobileCloseMenuIcon']

  toggleUserMenuVisibility() {
    if (this.userMenuTarget.classList.contains('opacity-0')) {
      this.userMenuTarget.classList.remove('transition', 'ease-in', 'duration-100');
      this.userMenuTarget.classList.add('transition', 'ease-out', 'duration-100');
      this.userMenuTarget.classList.remove('transform', 'opacity-0', 'scale-95');
      this.userMenuTarget.classList.add('transform', 'opacity-100', 'scale-100');
    } else {
      this.userMenuTarget.classList.remove('transition', 'ease-out', 'duration-100');
      this.userMenuTarget.classList.add('transition', 'ease-in', 'duration-100');
      this.userMenuTarget.classList.remove('transform', 'opacity-100', 'scale-100');
      this.userMenuTarget.classList.add('transform', 'opacity-0', 'scale-95');
    }
  };

  toggleMobileMenuVisibility() {
    if (this.mobileOpenMenuIconTarget.classList.contains('block')) {
      this.mobileMenuTarget.classList.replace('hidden', 'block');
      this.mobileOpenMenuIconTarget.classList.replace('block', 'hidden');
      this.mobileCloseMenuIconTarget.classList.replace('hidden', 'block');
    } else {
      this.mobileMenuTarget.classList.replace('block', 'hidden');
      this.mobileOpenMenuIconTarget.classList.replace('hidden', 'block');
      this.mobileCloseMenuIconTarget.classList.replace('block', 'hidden');
    }
  }
};
