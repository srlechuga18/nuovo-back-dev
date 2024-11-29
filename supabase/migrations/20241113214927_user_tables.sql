create table "public"."member" (
    "id" uuid not null,
    "created_at" timestamp with time zone not null default now(),
    "name" text
);


alter table "public"."member" enable row level security;

create table "public"."permission" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "role" text not null,
    "member_id" uuid not null
);


alter table "public"."permission" enable row level security;

CREATE UNIQUE INDEX member_pkey ON public.member USING btree (id);

CREATE UNIQUE INDEX permission_pkey ON public.permission USING btree (id);

alter table "public"."member" add constraint "member_pkey" PRIMARY KEY using index "member_pkey";

alter table "public"."permission" add constraint "permission_pkey" PRIMARY KEY using index "permission_pkey";

alter table "public"."permission" add constraint "permission_member_id_fkey" FOREIGN KEY (member_id) REFERENCES member(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."permission" validate constraint "permission_member_id_fkey";

grant delete on table "public"."member" to "anon";

grant insert on table "public"."member" to "anon";

grant references on table "public"."member" to "anon";

grant select on table "public"."member" to "anon";

grant trigger on table "public"."member" to "anon";

grant truncate on table "public"."member" to "anon";

grant update on table "public"."member" to "anon";

grant delete on table "public"."member" to "authenticated";

grant insert on table "public"."member" to "authenticated";

grant references on table "public"."member" to "authenticated";

grant select on table "public"."member" to "authenticated";

grant trigger on table "public"."member" to "authenticated";

grant truncate on table "public"."member" to "authenticated";

grant update on table "public"."member" to "authenticated";

grant delete on table "public"."member" to "service_role";

grant insert on table "public"."member" to "service_role";

grant references on table "public"."member" to "service_role";

grant select on table "public"."member" to "service_role";

grant trigger on table "public"."member" to "service_role";

grant truncate on table "public"."member" to "service_role";

grant update on table "public"."member" to "service_role";

grant delete on table "public"."permission" to "anon";

grant insert on table "public"."permission" to "anon";

grant references on table "public"."permission" to "anon";

grant select on table "public"."permission" to "anon";

grant trigger on table "public"."permission" to "anon";

grant truncate on table "public"."permission" to "anon";

grant update on table "public"."permission" to "anon";

grant delete on table "public"."permission" to "authenticated";

grant insert on table "public"."permission" to "authenticated";

grant references on table "public"."permission" to "authenticated";

grant select on table "public"."permission" to "authenticated";

grant trigger on table "public"."permission" to "authenticated";

grant truncate on table "public"."permission" to "authenticated";

grant update on table "public"."permission" to "authenticated";

grant delete on table "public"."permission" to "service_role";

grant insert on table "public"."permission" to "service_role";

grant references on table "public"."permission" to "service_role";

grant select on table "public"."permission" to "service_role";

grant trigger on table "public"."permission" to "service_role";

grant truncate on table "public"."permission" to "service_role";

grant update on table "public"."permission" to "service_role";


