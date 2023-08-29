import React, { useState, useEffect } from "react";
import axios from "axios";
import { Table, Paper, ScrollArea } from "@mantine/core";

import { Pharmacy } from "../@types/Pharmacy";

function PharmacyList() {
  const [rows, setRows] = useState<JSX.Element[]>([]);

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
        </tr>
      ));
      setRows(rows);
    };

    fetchData();
  }, []);

  return (
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
            </tr>
          </thead>
          <tbody>{rows}</tbody>
        </Table>
      </ScrollArea>
    </Paper>
  );
}

export default PharmacyList;
