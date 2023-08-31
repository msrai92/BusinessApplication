import { configureStore, ThunkAction, Action } from "@reduxjs/toolkit";
import pharmacySlice from "./pharmacySlice";
import alertSlice from "./alertSlice";

const store = configureStore({
  reducer: {
    pharmacy: pharmacySlice,
    alert: alertSlice,
  },
});

export type AppDispatch = typeof store.dispatch;
export type RootState = ReturnType<typeof store.getState>;
export type AppThunk<ReturnType = void> = ThunkAction<
  ReturnType,
  RootState,
  unknown,
  Action<string>
>;

export default store;
