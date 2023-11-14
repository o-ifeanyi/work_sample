# Eden Work Sample - Android and iOS Mobile App
Mobile application that runs on Android and iOS devices. 

## 💻 Quick Start 

- Clone the repository, run:
```
git clone https://github.com/o-ifeanyi/eden_ws
```
- Create a `.env` file at the root of the project and add this 👇🏾 to it
```
ABLY_KEY=<Your Ably Api Subscribe Key>
```
- Navigate into the project and run: `make gen` to run code generation
- Run the app in your Android or iOS device or simulator

## 🧪 Testing Realtime Updates

- Each user is connected to a unique channel with name `eden:<user_id>` and responds in realtime to messages published on `order_updates`. Publishing to `order_updates` can be done from the [Ably Dasboard.](https://ably.com/accounts/44542/apps/71975/console)
- By default each order starts at `ORDER PLACED`.
- Updating the order status:
    - First attach to a unique channel using `eden:<user_id>`, e.g `eden:ZbSz2jSlYsaOZ6UIrjRZauO0NMq1`
    - Enter `order_updates` as the **Event name** and `{ "uid": <user_id>, "order_id": <order_id>, "status": <order_status> }` as the **Message data** then hit the **Publish message** button.
    - There are 3 dummy orders on the app with `order_id` as `2023`, `2024`, `2025` respectively
    - The `order_status` tracked are:
    ```
    ORDER_ACCEPTED
    PICK_UP_IN_PROGRESS
    DROP_OFF_IN_PROGRESS
    ORDER_ARRIVED
    ORDER_DELIVERED
    ```
    - A sample message data would look like this `{ "uid": "ZbSz2jSlYsaOZ6UIrjRZauO0NMq1", "order_id": "2023", "status": "ORDER_ACCEPTED" }`
