import React from "react";
import { Provider } from "react-redux";
import store from "./store/store";

import "./App.css";
import PharmacyList from "./components/PharmacyList";
import AlertNotification from "./components/AlertNotification";

function App() {
  return (
    <Provider store={store}>
      <div className="App">
        <AlertNotification />
        <PharmacyList />
      </div>
    </Provider>
  );
}

export default App;
