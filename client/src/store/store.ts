import { configureStore, ThunkAction, Action } from "@reduxjs/toolkit";
import pharmacySlice from "./pharmacySlice";

const store = configureStore({
  reducer: {
    pharmacy: pharmacySlice,
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
