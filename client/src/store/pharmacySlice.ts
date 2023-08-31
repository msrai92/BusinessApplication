import { createSlice } from "@reduxjs/toolkit";
import axios from "axios";

import { Pharmacy } from "../@types/Pharmacy";
import { RootState, AppThunk } from "./store";
import { alert } from "./alertSlice";

interface PharmacyState {
  pharmacies: Pharmacy[];
  pharmacy: Pharmacy;
}
const initialState: PharmacyState = {
  pharmacies: [],
  pharmacy: {} as Pharmacy,
};

const pharmacySlice = createSlice({
  name: "Pharmacy",
  initialState,
  reducers: {
    getPharmacies(state, actions) {
      state.pharmacies = actions.payload;
    },
    setPharmacy(state, actions) {
      state.pharmacy = actions.payload;
    },
  },
});

export const { getPharmacies, setPharmacy } = pharmacySlice.actions;

export const pharmaciesSelector = (state: RootState) =>
  state.pharmacy.pharmacies;

export const pharmacySelector = (state: RootState) => state.pharmacy.pharmacy;

//API CALLS
export const getAllPharmacies = (): AppThunk => async (dispatch) => {
  try {
    const res = await axios.get(
      "https://localhost:7055/api/Pharmacy/GetPharmacies"
    );

    if (res.data.Data && res.data.isSuccess) {
      dispatch(getPharmacies(res.data.Data));
    } else {
      dispatch(alert(res.data.Message, "Danger"));
    }
  } catch (error) {
    if (error instanceof Error) dispatch(alert(error.message, "danger"));
  }
};

export const getByIdPharmacies =
  (id: number): AppThunk =>
  async (dispatch) => {
    try {
      const res = await axios.get(
        `https://localhost:7055/api/Pharmacy/GetPharmacyById/${id}`
      );
      console.log(res);
      if (res.data.Data && res.data.isSuccess) {
        dispatch(setPharmacy(res.data.Data));
      } else {
        dispatch(alert(res.data.Message, "Danger"));
      }
    } catch (error) {
      if (error instanceof Error) dispatch(alert(error.message, "danger"));
    }
  };

export default pharmacySlice.reducer;
