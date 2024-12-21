# FiveM Script: Logger Script

This script logs player connections on a FiveM server using ESX and sends the details to a Discord webhook.

## 🌟 Features
- Logs the following player details:
  - **Player Name**: In-game name of the player.
  - **IP Address**: Player's connection IP.
  - **Unique Identifier**: First identifier from FiveM.
- Sends a formatted message to a configurable Discord webhook.

## 📋 Requirements
- **FiveM Server** with **ESX** framework.
- A valid Discord webhook URL.

## 🛠️ Installation

1. Clone or download this repository into your `resources` folder:
   ```bash
   git clone https://github.com/your-repository/fivem-logger.git
   ```

2. Add the script to your `server.cfg`:
   ```cfg
   ensure fivem-logger
   ```

3. Configure the Discord webhook:
   - Open the script file and replace `INSERT HERE` with your Discord webhook URL:
     ```lua
     local webhookURL = 'INSERT HERE'
     ```

## ⚙️ Configuration
The script uses the `esx:playerLoaded` event to detect when players join the server. You can customize the message format sent to Discord by modifying the `message` table in the script.

Example:
```lua
local message = {
    {
        ["color"] = 15158332,
        ["title"] = "Nouveau Joueur Connecté",
        ["fields"] = {
            {
                ["name"] = "Nom",
                ["value"] = playerName or "Inconnu",
                ["inline"] = true
            },
            {
                ["name"] = "Identifiant",
                ["value"] = playerIdentifier or "Inconnu",
                ["inline"] = true
            },
            {
                ["name"] = "IP",
                ["value"] = playerIP or "Inconnu",
                ["inline"] = true
            }
        }
    }
}
```

## 🚀 Example Usage
When a player connects, the script sends a Discord message in this format:
```
Nouveau Joueur Connecté
Nom : Player123
Identifiant : steam:110000112345678
IP : 192.168.1.1
```

## 🛠️ Debugging
If you encounter issues, check the following:
- Ensure the Discord webhook URL is valid.
- Check server console logs for error messages.
- Verify that ESX is correctly set up on your server.

## 🤝 Contributing
Contributions are welcome! Feel free to open a pull request or create an issue for bugs or feature suggestions.

## 📜 License
This project is licensed under the MIT License. You are free to use, modify, and distribute it.

---
Thanks for using this script to enhance your FiveM server! If you have any questions, feel free to open an issue on the GitHub repository.

