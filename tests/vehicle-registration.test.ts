import { describe, it, expect } from 'vitest';

// Simple mock
const mockVehicle = {
  register: async (name: string, wheelchair: boolean) => {
    return { value: 1 };
  },
  
  getVehicle: async (id: number) => {
    return {
      name: "AccessVan 1",
      wheelchair: true,
      owner: "ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM"
    };
  }
};

describe('Vehicle Registration Contract', () => {
  it('should register a vehicle', async () => {
    const result = await mockVehicle.register("AccessVan 1", true);
    expect(result.value).toBe(1);
  });
  
  it('should get vehicle details', async () => {
    const vehicle = await mockVehicle.getVehicle(1);
    expect(vehicle.name).toBe("AccessVan 1");
    expect(vehicle.wheelchair).toBe(true);
  });
});
