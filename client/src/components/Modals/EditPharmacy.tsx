import React, { useState, useEffect } from "react";
import axios from "axios";
import { Modal, TextInput, Button, Group, NumberInput } from "@mantine/core";
import { useForm } from "@mantine/form";
import { cloneDeep } from "lodash";

import { Pharmacy } from "../../@types/Pharmacy";
import { useAppDispatch, useAppSelector } from "../../store/hooks";
import { getByIdPharmacies, pharmacySelector } from "../../store/pharmacySlice";
import { alert } from "../../store/alertSlice";

interface Props {
  title: string;
  id: number;
  opened: boolean;
  close: (isSuccess: boolean) => void;
}

interface PharmacyForm {
  Name: string;
  Address: string;
  City: string;
  State: string;
  Zip: string;
  NumberOfFilledPrescriptions: number;
}

const EditPharmacy = ({ title, id, opened, close }: Props) => {
  const dispatch = useAppDispatch();
  const pharmacy: Pharmacy = useAppSelector(pharmacySelector);

  let form = useForm({
    initialValues: {
      Name: "",
      Address: "",
      City: "",
      State: "",
      Zip: "",
      NumberOfFilledPrescriptions: 0,
    },
    validate: {
      Name: (value) => (value.length === 0 ? "Name is required" : null),
      Address: (value) => (value.length === 0 ? "Address is required" : null),
      City: (value) => (value.length === 0 ? "City is required" : null),
      State: (value) => (value.length === 0 ? "State is required" : null),
      Zip: (value) => (value.length === 0 ? "Zip is required" : null),
      NumberOfFilledPrescriptions: (value) =>
        value <= 0 ? "number of prescriptions is required" : null,
    },
    validateInputOnChange: [
      "Name",
      "Address",
      "City",
      "State",
      "Zip",
      "NumberOfFilledPrescriptions",
    ],
  });

  useEffect(() => {
    if (opened === false) return;
    dispatch(getByIdPharmacies(8));
  }, [id, dispatch, opened]);

  useEffect(() => {
    if (!(pharmacy && pharmacy.Id)) return;

    const initialValue = {
      Name: pharmacy.Name,
      Address: pharmacy.Address,
      City: pharmacy.City,
      State: pharmacy.State,
      Zip: pharmacy.Zip,
      NumberOfFilledPrescriptions: pharmacy.NumberOfFilledPrescriptions,
    };
    form.setValues((prev) => ({ ...prev, ...initialValue }));
  }, [pharmacy]);

  const onClose = (isSuccess: boolean) => {
    form.reset();
    close(isSuccess);
  };

  const updatePharmacy = async (values: PharmacyForm) => {
    const tempPharmacy = cloneDeep(pharmacy);
    if (!pharmacy.Id) return;
    tempPharmacy.Name = values.Name;
    tempPharmacy.Address = values.Address;
    tempPharmacy.City = values.City;
    tempPharmacy.State = values.State;
    tempPharmacy.Zip = values.Zip;
    tempPharmacy.NumberOfFilledPrescriptions =
      values.NumberOfFilledPrescriptions;
    try {
      const config = {
        headers: {
          "Content-Type": "application/json",
        },
      };

      const body = JSON.stringify(tempPharmacy);

      const res = await axios.put(
        "https://localhost:7055/api/Pharmacy/UpdatePharmacy",
        body,
        config
      );
      console.log(res);
      if (res.data.isSuccess) {
        onClose(true);
      }
    } catch (error) {
      if (error instanceof Error) {
        dispatch(alert(error.message, "danger"));
      }
    }
  };

  return (
    <>
      <Modal opened={opened} title={title} onClose={() => onClose(false)}>
        <form onSubmit={form.onSubmit((values) => updatePharmacy(values))}>
          <TextInput
            withAsterisk
            label="Name"
            placeholder="Name"
            {...form.getInputProps("Name")}
          />
          <TextInput
            withAsterisk
            label="Address"
            placeholder="Address"
            {...form.getInputProps("Address")}
          />
          <TextInput
            withAsterisk
            label="City"
            placeholder="City"
            {...form.getInputProps("City")}
          />
          <TextInput
            withAsterisk
            label="State"
            placeholder="State"
            {...form.getInputProps("State")}
          />
          <TextInput
            withAsterisk
            label="Zip"
            placeholder="Zip"
            {...form.getInputProps("Zip")}
          />
          <NumberInput
            mt="sm"
            label="Number of Filled Prescriptions"
            min={0}
            {...form.getInputProps("NumberOfFilledPrescriptions")}
          />
          <Group position="right" mt="md">
            <Button type="submit">Submit</Button>
          </Group>
        </form>
      </Modal>
    </>
  );
};

export default EditPharmacy;
