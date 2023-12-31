import { Router } from "express";
import { AuthRoutes } from "./modules/auth/auth.route";
import { DoctorRoutes } from "./modules/doctor/doctor.route";
import { TreatmentRoutes } from "./modules/treatment/treatment.route";
import { ProductRoutes } from "./modules/products/products.route";

const router = Router();

[
  { path: "/auth", route: AuthRoutes },
  { path: "/doctors", route: DoctorRoutes },
  { path: "/treatments", route: TreatmentRoutes },
  { path: "/products", route: ProductRoutes },
].forEach(({ path, route }) => router.use(path, route));

export const routes = router;
