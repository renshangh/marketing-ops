# Monitoring Hooks (Phase 1)

## Overview
The purpose of monitoring hooks is to capture all inbound and outbound activity across the marketing channels and feed it into the OpenClaw Control Panel for audit and analytics.

## Hook Types
1. **Message Ingest Hook** – Triggers on every new message in the subscribed channel (Discord, Telegram, WhatsApp).
   - Sends a JSON payload `{channel, messageId, author, timestamp, content}` to the logging endpoint.
2. **Error/Exception Hook** – Captures any unhandled exceptions in the Market agent scripts and forwards them to the alert channel.
3. **Performance Hook** – Records processing latency for each task (e.g., time from issue creation to response).

## Implementation Sketch (pseudo‑code)
```javascript
// Example for Discord (Node.js)
client.on('messageCreate', async (msg) => {
  if (msg.channel.id !== '1484259369309962281') return;
  await fetch(LOG_ENDPOINT, {
    method: 'POST',
    headers: {'Content-Type':'application/json'},
    body: JSON.stringify({
      channel: 'discord',
      messageId: msg.id,
      author: msg.author.id,
      timestamp: msg.createdTimestamp,
      content: msg.content,
    })
  });
});
```
*Similar adapters can be built for Telegram and WhatsApp using their respective SDKs.*

## Storage & Visualization
- **Log Store:** Use the OpenClaw `gateway` log service (or an external Elasticsearch instance).
- **Dashboard:** Kibana/Grafana panel displaying message volume, error spikes, and latency trends.
- **Retention:** Keep raw logs for 30 days, aggregated metrics indefinitely.

## Next Steps
1. Deploy the hook scripts to the Market agent runtime.
2. Configure the `LOG_ENDPOINT` and secret keys in the shared vault.
3. Validate that each channel emits a test payload and appears in the Control Panel.
