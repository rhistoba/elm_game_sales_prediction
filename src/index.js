import { Elm } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';
import 'semantic-ui-css/semantic.min.css'

Elm.Main.init({
  node: document.getElementById('root'),
  flags: {
    environment: process.env.NODE_ENV,
    gsp_request_url: process.env.ELM_APP_GSP_REQUEST_URL,
    gsp_api_key: process.env.ELM_APP_GSP_API_KEY,
    gsp_subscription_key: process.env.ELM_APP_GSP_SUBSCRIPTION_KEY
  }
});

registerServiceWorker();
