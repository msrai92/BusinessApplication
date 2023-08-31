import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import { v4 as uuidv4 } from "uuid";

import { Pharmacy } from "../@types/Pharmacy";
import { RootState, AppThunk } from "./store";

interface AlertState {
  message: string;
  type: string;
  id: number;
}
const initialState: AlertState[] = [];

const alertSlice = createSlice({
  name: "Alert",
  initialState,
  reducers: {
    setAlert(state, actions) {
      return [...state, actions.payload];
    },
    removeAlert(state, actions) {
      return state.filter((alert) => alert.id === actions.payload.id);
    },
  },
});

export const { setAlert, removeAlert } = alertSlice.actions;

export const alertSelector = (state: RootState) => state.alert;

export const alert =
  (message: string, type: string, timeout = 5000): AppThunk =>
  (dispatch) => {
    const id = uuidv4();
    dispatch(setAlert({ message, type, id }));
    setTimeout(() => dispatch(removeAlert(id)), timeout);
  };

export default alertSlice.reducer;
