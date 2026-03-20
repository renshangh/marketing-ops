# Mark Agent Social Integration Runbook

This runbook captures the remaining work for Issue #7: provision Mark’s social messaging infrastructure and keep Randy’s Control Panel in sync. It focuses on Telegram (primary channel) and describes how to add additional endpoints (WhatsApp, other social feeds) in a repeatable, observable way.

## Discord: Mark Channel (Live)

- Agent name: Mark
- Internal agent id: `market`
- Discord account: `mark`
- Primary channel: #agent-market
- Channel ID: 1484259369309962281
- requireMention: true

Notes:
- Mark is already live on Discord.
- Use #agent-market for marketing ops intake, support-business skills, and comms workflow setup.

> Naming note: “Market” was the legacy name. The bot/operator name is now **Mark**, while the internal agent id remains `market` until a full rename.

## Telegram: Channel + Webhook Setup

1. **Create the Mark bot.**
   - Talk to BotFather at `@BotFather` and run `/newbot`. Follow the prompts to name it `Mark` or another branded persona.
   - Copy the generated bot token and store it in a vault (or `marketing-ops/.env` as `MARK_TELEGRAM_BOT_TOKEN`).

2. **Reserve a Telegram channel/group.**
   - Create a private or public channel (e.g., `@randi-mark`) that Mark will use to post updates and ingest inbound requests.
   - Add the Mark bot as an administrator with permissions to post messages and read content.
   - Use `curl "https://api.telegram.org/bot<TOKEN>/getUpdates"` to capture the channel’s chat ID. Record the ID in `docs/market_social_integration.md` or the per-channel tracking sheet (include it in the Marketing War Room runbook).

3. **Configure the webhook.**
   - Choose a receiver (e.g., an outbound script in this repo such as `scripts/telegram_bridge.py` or a lightweight webhook service). The handler should:
     1. Validate the Telegram update signature.
     2. Forward inbound text to Randy’s Control Panel (e.g., a Discord channel via `discord` skill or a log aggregator).
     3. Relay Market’s replies back to Telegram with `/sendMessage`.
   - Set the webhook with:
     ```bash
     curl -X POST "https://api.telegram.org/bot$MARK_TELEGRAM_BOT_TOKEN/setWebhook" \
       -d "url=https://<your-public-endpoint>/mark/telegram"
     ```
   - Keep the endpoint alive (use ngrok or a reverse proxy when testing locally).
   - Ensure the webhook uses `https://` and responds to Telegram with HTTP 200 quickly.

4. **Automate outbound posts.**
   - Use a script (e.g., `marketing-ops/scripts/dispatch_mark_post.py`) that reads approved content from `marketing-ops/content/` and posts it via `sendMessage` or `sendPhoto`.
   - Store the schema in `marketing-ops/content/schema.yml` if needed.

5. **Document the integration.**
   - Save the following metadata:
     - Bot username/account
     - Bot token location (vault path or environment variable)
     - Channel chat ID
     - Active webhook URL
     - Monitoring/alert plan (e.g., `logs/mark/telegram_webhook.log` or health checks in the Marketing War Room)
   - Reference this runbook in `README.md` so anyone onboarding the Mark agent knows where to look.

## WhatsApp / Other Social Endpoints

1. **Choose an API provider.** (Twilio, Meta’s Business API, or a third-party aggregator.)
   - Reserve a dedicated phone number or WhatsApp Business profile for Mark.
   - Document the account credentials (SID, Auth Token, phone ID) in the vault.

2. **Configure inbound webhooks.**
   - Similar to Telegram, have the webhook forward messages into Randy’s Control Panel and echo replies.
   - Keep a `MARK_WHATSAPP_WEBHOOK` environment variable with the inbound handler endpoint.
   - Provide a fallback when the provider returns preview events (e.g., use `Twilio` to queue requests and ack them). 

3. **Plan content synchronization.**
   - Use the same content store as Telegram, but branch the dispatcher to post via the respective APIs.
   - Implement rate limiting and dedupe so channels don’t spam the same audience simultaneously.

4. **Monitor & observability.**
   - Log every inbound/outbound message (timestamps, IDs, user handles) to `marketing-ops/logs/social.log`.
   - Add a healthcheck endpoint that returns the last 5 successful sends and exposures.

## Runbook & Handoff

- Track each endpoint in the Marketing Control spreadsheet (prefixed by `mark-telegram`, `mark-whatsapp`).
- When Mark receives inbound traffic, post a short notice in `#agent-market` and `#agent-social` so Ember/Sarah can reroute follow-ups.
- List actionable alerts (e.g., failed webhook, token rotation required) in this runbook’s `## Alerts` section once triggered.
- Update Issue #7 with status snippets and close subtasks as soon as channels are verified.

## Issue #7 Progress
- [x] Discord channel provisioned for Mark (#agent-market)
- [ ] Telegram bot + webhook provisioning
- [ ] WhatsApp/other social endpoints
- [ ] Runbook complete + channel IDs documented

## Alerts (Template)
- Webhook failure: Mark bot webhook returns a 5xx or Telegram/Twilio status changes.
- Token rotation: BotFather/Twilio rotates keys; update the vault + restart the dispatcher.
- Channel down: Wharf detection if the `sendMessage` call repeatedly fails.
