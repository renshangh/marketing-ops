# Marketing Ops Repository

This repository hosts the tools, runbooks, and automation that support the **Mark** agent (internal id: `market`) across Discord, Telegram, WhatsApp, and other social platforms.

## Key Assets
- `roadmap_marketing_ops_2026.md`: Vision document that mirrors `randy-operating-system/docs/roadmap_ops_2026.md` but hones in on Market’s multi-channel command center.
- `docs/market_social_integration.md`: Runbook for provisioning Market’s Telegram channel/webhook, extending to WhatsApp/other endpoints, and logging the integration state so inbound social requests reach Randy’s Control Panel.

## Discord Status (Mark)
- Mark is live on Discord.
- Primary channel: #agent-market (Channel ID: 1484259369309962281)
- Internal agent id remains `market` for routing purposes.
- Require mention: true

## Next Steps
- Use Issue #7 (https://github.com/renshangh/marketing-ops/issues/7) to track provisioning of Discord/Telegram/WhatsApp channels.
- Store secrets (bot tokens, webhook URLs, phone numbers) in the shared vault before wiring the endpoints.
