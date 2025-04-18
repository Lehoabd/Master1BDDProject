import { writable } from "svelte/store";

export const nomLogin = writable('');

export const userPrivilege = writable(false);