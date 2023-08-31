import React, { useEffect } from "react";
import { Alert } from "@mantine/core";

import { useAppSelector } from "../store/hooks";
import { alertSelector } from "../store/alertSlice";
import { AlertType } from "../@types/Alert";

const AlertNotification = () => {
  const alerts: AlertType[] = useAppSelector(alertSelector);
  const colors: Record<string, string> = {
    danger: "red",
    warning: "yellow",
    success: "green",
  };
  useEffect(() => {
    console.log("alerts: ", alerts);
  }, [alerts]);

  return (
    <div className="alert-container">
      {alerts.map((alert) => (
        <Alert key={alert.id} color={colors[alert.type]}>
          {alert.message}
        </Alert>
      ))}
    </div>
  );
};

export default AlertNotification;
