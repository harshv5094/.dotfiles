#!/bin/sh -e

# Install ufw via pacman
package_manager=$(command -v pacman || true)
if [ -n "${package_manager}" ]; then
  "${ESCALATION_TOOL}" "${package_manager}" -S --noconfirm ufw
fi

if have ufw; then
  info_msg "** Enable my default firewall rules **"
  "${ESCALATION_TOOL}" ufw limit 22/tcp
  "${ESCALATION_TOOL}" ufw allow 80/tcp
  "${ESCALATION_TOOL}" ufw allow 443/tcp
  "${ESCALATION_TOOL}" ufw default deny incoming
  "${ESCALATION_TOOL}" ufw default allow outgoing
  info_msg "** Enable ufw systemd service **"
  "${ESCALATION_TOOL}" ufw enable
fi
