import pandas as pd
import numpy as np
from scipy.spatial.transform import Rotation as R

# Load your CAN IMU CSV
imu = pd.read_csv("imu_log_combined.csv")

# Clean the data - remove NaN values
print(f"Total rows: {len(imu)}")
print(f"NaN in gyro_x: {imu.gyro_x.isna().sum()}")
print(f"NaN in gyro_y: {imu.gyro_y.isna().sum()}")
print(f"NaN in gyro_z: {imu.gyro_z.isna().sum()}")

# Drop rows with any NaN gyro values
imu_clean = imu.dropna(subset=['gyro_x', 'gyro_y', 'gyro_z']).copy()
print(f"Rows after cleaning: {len(imu_clean)}")

# Initialize orientation (identity quaternion)
q = R.from_quat([0, 0, 0, 1])
orientations = []
dt = 0.01  # 10ms sample rate

for idx, (gx, gy, gz) in enumerate(zip(imu_clean.gyro_x, imu_clean.gyro_y, imu_clean.gyro_z)):
    # Gyro is in deg/s — convert to rad/s
    omega = np.deg2rad([gx, gy, gz])
    
    # Check for valid gyro readings
    if np.any(np.isnan(omega)) or np.any(np.isinf(omega)):
        print(f"Warning: Invalid gyro at index {idx}: [{gx}, {gy}, {gz}]")
        # Use previous orientation
        orientations.append(orientations[-1] if orientations else [0, 0, 0])
        continue
    
    # Small-angle quaternion update
    angle = np.linalg.norm(omega * dt)
    
    # Only update if there's meaningful rotation (avoid numerical issues)
    if angle > 1e-8:
        dq = R.from_rotvec(omega * dt)
        q = dq * q
        
        # Normalize quaternion periodically to prevent drift
        if idx % 100 == 0:
            q = R.from_quat(q.as_quat())  # Re-normalize
    
    # Get Euler angles
    euler = q.as_euler('xyz', degrees=True)
    orientations.append(euler)

# Add orientations back to cleaned dataframe
imu_clean["roll"] = [o[0] for o in orientations]
imu_clean["pitch"] = [o[1] for o in orientations]
imu_clean["yaw"] = [o[2] for o in orientations]

# Save results
imu_clean[["timestamp", "roll", "pitch", "yaw"]].to_csv("imu_orientation.csv", index=False)

print("\nOrientation Summary:")
print(f"Roll range: [{imu_clean.roll.min():.2f}, {imu_clean.roll.max():.2f}] degrees")
print(f"Pitch range: [{imu_clean.pitch.min():.2f}, {imu_clean.pitch.max():.2f}] degrees")
print(f"Yaw range: [{imu_clean.yaw.min():.2f}, {imu_clean.yaw.max():.2f}] degrees")
print("\nOutput saved to imu_orientation.csv")