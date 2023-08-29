import React, { useState, useEffect } from "react";
import axios from "axios";
import { Table, Paper, ScrollArea, Button } from "@mantine/core";
import { FaEdit } from "react-icons/fa";
import { useDisclosure } from "@mantine/hooks";

import EditPharmacy from "./Modals/EditPharmacy";

import { Pharmacy } from "../@types/Pharmacy";

function PharmacyList() {
  const [rows, setRows] = useState<JSX.Element[]>([]);
  const [id, setId] = useState(-1);
  const [opened, { open, close }] = useDisclosure(false);

  const onOpen = (rowId: number) => {
    if (rowId === -1) return;
    setId(rowId);
    open();
  };

  useEffect(() => {
    const fetchData = async () => {
      const res = await axios.get(
        "https://localhost:7055/api/Pharmacy/GetPharmacies"
      );

      const rows: JSX.Element[] = res.data.Data.map((element: Pharmacy) => (
        <tr key={element.Id}>
          <td className="md-w">{element.Name}</td>
          <td className="md-w">{element.Address}</td>
          <td className="sm-w">{element.City}</td>
          <td className="sm-w">{element.State}</td>
          <td>{element.Zip}</td>
          <td>
            <Button
              rightIcon={<FaEdit />}
              variant="subtle"
              size="xs"
              color="green"
              uppercase
              onClick={() => onOpen(element.Id || -1)}
            >
              Edit
            </Button>
          </td>
        </tr>
      ));
      setRows(rows);
    };

    fetchData();
  }, []);

  return (
    <>
      <Paper style={{ maxWidth: "60vw" }} shadow="sm" radius="md" p="md">
        <ScrollArea h={500}>
          <Table verticalSpacing="sm">
            <thead>
              <tr>
                <th>Name</th>
                <th>Address</th>
                <th>City</th>
                <th>State</th>
                <th>Zip</th>
                <th></th>
              </tr>
            </thead>
            <tbody>{rows}</tbody>
          </Table>
        </ScrollArea>
      </Paper>
      <EditPharmacy
        id={id}
        opened={opened}
        title="Edit Pharmacy"
        close={close}
      />
    </>
  );
}

export default PharmacyList;
