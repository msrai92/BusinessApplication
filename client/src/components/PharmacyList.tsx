import React, { useState, useEffect } from "react";
import { Table, Paper, ScrollArea, Button } from "@mantine/core";
import { FaEdit } from "react-icons/fa";
import { useDisclosure } from "@mantine/hooks";

import { useAppDispatch, useAppSelector } from "../store/hooks";
import { pharmaciesSelector } from "../store/pharmacySlice";
import { getAllPharmacies } from "../store/pharmacySlice";
import EditPharmacy from "./Modals/EditPharmacy";
import { Pharmacy } from "../@types/Pharmacy";

function PharmacyList() {
  const [rows, setRows] = useState<JSX.Element[]>([]);
  const [id, setId] = useState(-1);
  const [opened, { open, close }] = useDisclosure(false);
  const dispatch = useAppDispatch();
  const _pharmacies: Pharmacy[] = useAppSelector(pharmaciesSelector);

  const onOpen = (rowId: number) => {
    if (rowId === -1) return;
    setId(rowId);
    open();
  };

  const onClose = (isSuccess: boolean) => {
    if (isSuccess) dispatch(getAllPharmacies());
    close();
  };

  useEffect(() => {
    dispatch(getAllPharmacies());
  }, []);

  useEffect(() => {
    const mappedRows: JSX.Element[] = _pharmacies.map((element: Pharmacy) => (
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
    setRows(mappedRows);
  }, [_pharmacies]);

  return (
    <>
      <Paper style={{ maxWidth: "60vw" }} shadow="sm" radius="md" p="md">
        <ScrollArea h={500}>
          {rows.length > 0 ? (
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
          ) : (
            <h2>No pharmacies found</h2>
          )}
        </ScrollArea>
      </Paper>
      <EditPharmacy
        id={id}
        opened={opened}
        title="Edit Pharmacy"
        close={onClose}
      />
    </>
  );
}

export default PharmacyList;
