import { LitElement, html } from 'lit';

class MyCardSkeleton extends LitElement {
  static get properties() {
    return { hass: Object, config: Object };
  }
  setConfig(config) { this.config = config; }
  render() {
    return html`<div>Ma carte freegate skeleton : ${this.config.title}</div>`;
  }
}

customElements.define('card-skeleton', MyCardSkeleton);
