import React, { useState, useEffect } from "react";
import axios from "axios";
import { Modal, TextInput, Button, Group, NumberInput } from "@mantine/core";
import { useForm } from "@mantine/form";

import { Pharmacy } from "../../@types/Pharmacy";

interface Props {
  title: string;
  id: number;
  opened: boolean;
  close: () => void;
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
  const [pharmacy, setPharmacy] = useState({} as Pharmacy);
  const form = useForm({
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
    const fetchData = async () => {
      if (!id) return;
      const res = await axios.get(
        `https://localhost:7055/api/Pharmacy/GetPharmacyById/${id}`
      );
      console.log(res.data.Data);
      const pharmacy = res.data.Data;
      setPharmacy(pharmacy);
      if (!pharmacy) return;
      const initialValue = {
        Name: pharmacy.Name,
        Address: pharmacy.Address,
        City: pharmacy.City,
        State: pharmacy.State,
        Zip: pharmacy.Zip,
        NumberOfFilledPrescriptions: pharmacy.NumberOfFilledPrescriptions,
      };
      form.setValues(initialValue);
    };

    fetchData();
  }, [id]);

  const updatePharmacy = async (values: PharmacyForm) => {
    if (!pharmacy.Id) return;
    pharmacy.Name = values.Name;
    pharmacy.Address = values.Address;
    pharmacy.City = values.City;
    pharmacy.State = values.State;
    pharmacy.Zip = values.Zip;
    pharmacy.NumberOfFilledPrescriptions = values.NumberOfFilledPrescriptions;
    try {
      const config = {
        headers: {
          "Content-Type": "application/json",
        },
      };

      const body = JSON.stringify(pharmacy);

      const res = await axios.put(
        "https://localhost:7055/api/Pharmacy/UpdatePharmacy",
        body,
        config
      );
      console.log(res);
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <>
      <Modal opened={opened} title={title} onClose={close}>
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
