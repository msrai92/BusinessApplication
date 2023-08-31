import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";

import { Pharmacy } from "../@types/Pharmacy";
import { RootState, AppThunk } from "./store";

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

    if (res.data.Data) dispatch(getPharmacies(res.data.Data));
  } catch (error) {}
};

export const getByIdPharmacies =
  (id: number): AppThunk =>
  async (dispatch) => {
    try {
      const res = await axios.get(
        `https://localhost:7055/api/Pharmacy/GetPharmacyById/${id}`
      );

      if (res.data.Data) dispatch(setPharmacy(res.data.Data));
    } catch (error) {}
  };

export default pharmacySlice.reducer;
