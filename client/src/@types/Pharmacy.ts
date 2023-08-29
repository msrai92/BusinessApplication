export interface Pharmacy {
  Id?: number;
  Name: string;
  Address: string;
  City: string;
  State: string;
  Zip: string;
  NumberOfFilledPrescriptions?: number;
  CreatedDate?: Date;
}
