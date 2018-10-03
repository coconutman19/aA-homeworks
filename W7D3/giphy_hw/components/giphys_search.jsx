import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from '../store/store';
import { fetchSearchGiphys } from '../util/api_util';
import {receiveSearchGiphys} from '../actions/giphy_actions';
import {RECEIVE_SEARCH_GIPHYS} from '../actions/giphy_actions';

// import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const root = document.getElementById('root');
  window.fetchSearchGiphys = fetchSearchGiphys;
  window.store = store;
  window.receiveSearchGiphys = receiveSearchGiphys;
});
