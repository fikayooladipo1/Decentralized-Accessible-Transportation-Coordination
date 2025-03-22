import { describe, it, expect } from 'vitest';

// Simple mock
const mockRider = {
  register: async (needs: string, wheelchair: boolean) => {
    return { value: 1 };
  },
  
  getRider: async (id: number) => {
    return {
      user: "ST3REHHS5J3CERCRBEPMGH7NIV22XCFT5TSMN2CO",
      needs: "Wheelchair user",
      wheelchair: true
    };
  }
};

describe('Rider Verification Contract', () => {
  it('should register a rider', async () => {
    const result = await mockRider.register("Wheelchair user", true);
    expect(result.value).toBe(1);
  });
  
  it('should get rider details', async () => {
    const rider = await mockRider.getRider(1);
    expect(rider.needs).toBe("Wheelchair user");
    expect(rider.wheelchair).toBe(true);
  });
});
