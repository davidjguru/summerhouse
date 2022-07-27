import React from 'react';
import ReactDOM from 'react-dom/client';
import './styles/index.css';
import { App } from './components/App/App';
import {
  ApolloProvider,
  ApolloClient,
  createHttpLink,
  InMemoryCache
} from '@apollo/client';

const root = ReactDOM.createRoot(document.getElementById('root'));
const httpLink = createHttpLink({
  uri: 'http://summerhouse.ddev.site/graphql'
});
const client = new ApolloClient({
  link: httpLink,
  cache: new InMemoryCache()
});

root.render(
  <React.StrictMode>
    <ApolloProvider client={client}>
      <App />
    </ApolloProvider>
  </React.StrictMode>
);

